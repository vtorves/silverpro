require 'spec_helper'

describe Update do
  describe "validations" do
    it{ should validate_presence_of :project_id }
    it{ should validate_presence_of :user_id }
    it{ should validate_presence_of :comment }
    it{ should validate_presence_of :comment_html }
  end

  describe "associations" do
    it{ should belong_to :user }
    it{ should belong_to :project }
  end

  describe ".visible_to" do
    let(:project) { create(:project) }
    let(:user) {}

    before do
      @exclusive_update = create(:update, exclusive: true, project: project)
      @update = create(:update, project: project)
    end

    subject { Update.visible_to(user) }

    context "when user is a contribution" do
      let(:user) { create(:contribution, state: 'confirmed', project: project).user }

      it { should have(2).itens }
    end

    context "when user is not a contribution" do
      let(:user) { create(:contribution, state: 'pending', project: project).user }

      it { should eq([@update]) }
    end

    context "when user is a project owner" do
      let(:user) { project.user }

      it { should have(2).itens }
    end

    context "when user is an admin" do
      let(:user) { create(:user, admin: true) }

      it { should have(2).itens }
    end

    context "when user is a guest" do
      it { should eq([@update]) }
    end
  end


  describe ".create" do
    subject{ create(:update, comment: "this is a comment\n") }
    its(:comment_html){ should == "<p>this is a comment</p>\n" }
  end

  describe "#email_comment_html" do
    subject{ create(:update, comment: "this is a comment\nhttp://vimeo.com/6944344\n![](http://catarse.me/assets/catarse/logo164x54.png)").email_comment_html }
    it{ should == "<p>this is a comment\n<a href=\"http://vimeo.com/6944344\">http://vimeo.com/6944344</a>\n<img src=\"http://catarse.me/assets/catarse/logo164x54.png\" alt=\"\"></p>\n" }
  end

  describe "#update_number" do
    let(:project){ create(:project) }
    let(:update){ create(:update, project: project) }
    subject{ update.update_number }
    before do
      create(:update, project: project)
      update
      create(:update, project: project)
    end
    it{ should == 2 }
  end

  describe "#notify_contributors" do
    before do
      Notification.unstub(:notify)
      Notification.unstub(:notify_once)
      @project = create(:project)
      contribution = create(:contribution, state: 'confirmed', project: @project)
      create(:contribution, state: 'confirmed', project: @project, user: contribution.user)
      @project.reload
      ActionMailer::Base.deliveries = []
      @update = Update.create!(user: @project.user, project: @project, title: "title", comment: "this is a comment\nhttp://vimeo.com/6944344\n![](http://catarse.me/assets/catarse/logo164x54.png)")
      Notification.should_receive(:notify_once).with(
        :updates,
        contribution.user,
        {update_id: @update.id, user_id: contribution.user.id},
        {
          project: @update.project,
          project_update: @update,
          origin_email: @update.project.user.email,
          origin_name: @update.project.user.display_name
        }
      ).once.and_call_original
    end

    it 'should call Notification.notify once' do
      @update.notify_contributors
    end
  end
end

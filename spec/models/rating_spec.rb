require 'spec_helper'

describe Rating do
  let! (:luigi) {Fabricate(:user, username: 'luigi')}
  let! (:aiden) {Fabricate(:user, username: 'aiden')}
  let! (:samus) {Fabricate(:user, username: 'samus')}
  let! (:zelda) {Fabricate(:user, username: 'zelda')}
  let! (:lp1) {Fabricate(:post, content: 'razzmatazzes', user: luigi)}
  let! (:lp2) {Fabricate(:post, content: 'quizzicality', user: luigi)}
  let! (:lp3) {Fabricate(:post, content: 'blackjacking', user: luigi)}
  let! (:ap1) {Fabricate(:post, content: 'embezzlement', user: aiden)}
  let! (:ap2) {Fabricate(:post, content: 'hydroxyzines', user: aiden)}
  let! (:ap3) {Fabricate(:post, content: 'puzzleheaded', user: aiden)}
  let! (:sp1) {Fabricate(:post, content: 'katzenjammer', user: samus)}
  let! (:sp2) {Fabricate(:post, content: 'subjectivize', user: samus)}
  let! (:sp3) {Fabricate(:post, content: 'bedazzlement', user: samus)}
  let! (:zp1) {Fabricate(:post, content: 'hypercomplex', user: zelda)}
  let! (:zp2) {Fabricate(:post, content: 'frizzinesses', user: zelda)}
  let! (:zp3) {Fabricate(:post, content: 'mythologized', user: zelda)}
  it { should belong_to :post }
  it { should belong_to :user }
  it { should validate_presence_of :opinion }

  describe 'create_rating' do
    context 'all valid' do
      it 'should create the rating' do
        rating1 = Rating.create(post: lp3, user: samus, opinion: -1)
        rating2 = Rating.create(post: ap2, user: zelda, opinion: 0)
        rating3 = Rating.create(post: sp1, user: aiden, opinion: 1)
      end
    end
    context 'invalid post' do
      it 'should not create the rating' do
        rating = Rating.create(post_id: 999, user: luigi, opinion: 1)
      end
    end
    context 'invalid user' do
      it 'should not create the rating' do
        rating = Rating.create(post: sp2, user_id: 99999, opinion: 1)
      end
    end
    context 'invalid opinion upper bounds' do
      it 'should not create the rating' do
        rating = Rating.create(post: zp3, user: samus, opinion: 2)
      end
    end
    context 'invalid opinion lower bounds' do
      it 'should not create the rating' do
        rating = Rating.create(post: zp3, user: luigi, opinion: -2)
      end
    end
  end

  describe 'modify_rating' do
    context 'rating exists' do
      it 'should allow opinion to be modified' do
      end
      it 'should not allow post to be modified' do
      end
      it 'should not allow user to be modified' do
      end
    end
  end

  describe 'view_all_for_post' do
    context 'post has ratings' do
      it 'shows count of all postitive ratings' do
      end
      it 'shows count of all negative ratings' do
      end
      it 'shows count of all neutral ratings' do
      end
      it 'shows count of all ratings' do
      end
    end
  end
end

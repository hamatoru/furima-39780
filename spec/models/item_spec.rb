require 'rails_helper'
RSpec.describe Item, type: :model do

  before do
    @item = FactoryBot.build(:item)
  end


  describe '商品出品登録' do

  context '商品出品できるとき' do
    it '全ての項目が入力されていると出品できる' do
      expect(@item).to be_valid
    end
  end

  context '商品出品できないとき' do
  it 'userが紐づいていないと出品できない' do
  @item.user = nil
  @item.valid?
  expect(@item.errors.full_messages).to include("User must exist")
  end
  it 'imageが空だと出品できない' do
    @item.image = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Image can't be blank")
  end
  it 'item_nameが空では出品できない' do
    @item.item_name = ''
    @item.valid?
    expect(@item.errors.full_messages).to include ("Item name can't be blank")
  end
  it 'item_infoが空では出品できない' do
    @item.item_info = ''
    @item.valid?
    expect(@item.errors.full_messages).to include ("Item info can't be blank")
  end
  it 'category_idが空だと出品できない' do
    @item.category_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include ("Category can't be blank")
  end
  it 'category_idに「---」が選択されている場合は出品できない' do
    @item.category_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include ("Category can't be blank")
  end
  it 'sale_status_idが空だと出品できない' do
    @item.sale_status_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include ("Sale status can't be blank")
  end
  it 'sale_status_idに「---」が選択されている場合は出品できない' do
    @item.sale_status_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include ("Sale status can't be blank")
  end
  it 'shipping_status_idが空だと出品できない' do
    @item.shipping_status_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include ("Shipping status can't be blank")
  end
  it 'shipping_status_idに「---」が選択されている場合は出品できない' do
    @item.shipping_status_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include ("Shipping status can't be blank")
  end
  it 'prefecture_idが空だと出品できない' do
    @item.prefecture_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include ("Prefecture can't be blank")
  end
  it 'prefecture_idに「---」が選択されている場合は出品できない' do
    @item.prefecture_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include ("Prefecture can't be blank")
  end
  it 'scheduled_delivery_idが空だと出品できない' do
    @item.scheduled_delivery_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include ("Scheduled delivery can't be blank")
  end
  it 'scheduled_delivery_idに「---」が選択されている場合は出品できない' do
    @item.scheduled_delivery_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include ("Scheduled delivery can't be blank")
  end
  it 'priceが空だと出品できない' do
    @item.price = 'nil'
    @item.valid?
    expect(@item.errors.full_messages).to include ("Price is not a number")
  end
  it 'priceが全角数字だと出品できない' do
    @item.price = ''
    @item.valid?
    expect(@item.errors.full_messages).to include ("Price can't be blank")
  end
  it 'priceが300円未満だと出品できない' do
    @item.price = 299
    @item.valid?
    expect(@item.errors.full_messages).to include ("Price must be greater than or equal to 300")
  end
  it 'priceが9,999,999円を超えると出品できない' do
    @item.price = 10_000_000
    @item.valid?
    expect(@item.errors.full_messages).to include ("Price must be less than or equal to 9999999")
  end

  end
  end
end
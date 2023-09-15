require 'rails_helper'
RSpec.describe Item, type: :model do

  before do
    @item = FactoryBot.build(:item)
  end


  describe '商品出品登録' do

  context '商品出品できるとき' do
    it '全ての項目が入力されていると登録できる' do
      expect(@item).to be_valid
    end
  end

  context '商品出品できないとき' do
  it 'imageが空だと登録できない' do
    @item.image = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Image can't be blank")
  end
  it 'item_nameが空では登録できない' do
    @item.item_name = ''
    @item.valid?
    expect(@item.errors.full_messages).to include ("Item name can't be blank")
  end
  it 'item_infoが空では登録できない' do
    @item.item_info = ''
    @item.valid?
    expect(@item.errors.full_messages).to include ("Item info can't be blank")
  end
  it 'category_idが空だと登録できない' do
    @item.category_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include ("Category can't be blank")
  end
  it 'sale_status_idが空だと登録できない' do
    @item.sale_status_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include ("Sale status can't be blank")
  end
  it 'shipping_status_idが空だと登録できない' do
    @item.shipping_status_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include ("Shipping status can't be blank")
  end
  it 'prefecture_idが空だと登録できない' do
    @item.prefecture_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include ("Prefecture can't be blank")
  end
  it 'scheduled_delivery_idが空だと登録できない' do
    @item.scheduled_delivery_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include ("Scheduled delivery can't be blank")
  end
  it 'priceが空だと登録できない' do
    @item.price = 'nil'
    @item.valid?
    expect(@item.errors.full_messages).to include ("Price Input half-width characters")
  end
  it 'priceが全角数字だと登録できない' do
    @item.price = ''
    @item.valid?
    expect(@item.errors.full_messages).to include ("Price Input half-width characters")
  end
  it 'priceが設定範囲外の数字だと登録できない' do
    @item.price = 'from: 299'
    @item.valid?
    expect(@item.errors.full_messages).to include ("Price Input half-width characters")
  end


  end
  end
end
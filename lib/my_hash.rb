class MyHash
  def initialize(size = 16)
    @buckets = Array.new(size) { [] }
    @size = size
  end

  # キーを整数値に変換し、バケットのインデックスを計算
  def hash_key(key)
    key.to_s.chars.map(&:ord).sum % @size
  end

  # キーと値を格納
  def []=(key, value)
    index = hash_key(key)
    bucket = @buckets[index]

    bucket.each { |peir| if peir[0] == key; peir[1] = value; return end }
    bucket << [key, value]
  end

  # キーに対応する値を取得
  def [](key)
    index = hash_key(key)
    bucket = @buckets[index]

    peir = bucket.find { |peir| peir[0] == key }
    peir ? peir[1] : nil
  end

  # 指定したキーが存在するかを判定
  def key?(key)
    !self[key].nil?
  end
end
{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.TextEntity where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.TextEntityType as TextEntityType
import qualified Utils as U

-- |
data TextEntity = -- | Represents a part of the text that needs to be formatted in some unusual way @offset Offset of the entity, in UTF-16 code units @length Length of the entity, in UTF-16 code units @type Type of the entity
  TextEntity
  { -- |
    _type :: Maybe TextEntityType.TextEntityType,
    -- |
    _length :: Maybe Int,
    -- |
    offset :: Maybe Int
  }
  deriving (Eq)

instance Show TextEntity where
  show
    TextEntity
      { _type = _type_,
        _length = _length_,
        offset = offset_
      } =
      "TextEntity"
        ++ U.cc
          [ U.p "_type" _type_,
            U.p "_length" _length_,
            U.p "offset" offset_
          ]

instance T.FromJSON TextEntity where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "textEntity" -> parseTextEntity v
      _ -> mempty
    where
      parseTextEntity :: A.Value -> T.Parser TextEntity
      parseTextEntity = A.withObject "TextEntity" $ \o -> do
        _type_ <- o A..:? "type"
        _length_ <- o A..:? "length"
        offset_ <- o A..:? "offset"
        return $ TextEntity {_type = _type_, _length = _length_, offset = offset_}
  parseJSON _ = mempty

instance T.ToJSON TextEntity where
  toJSON
    TextEntity
      { _type = _type_,
        _length = _length_,
        offset = offset_
      } =
      A.object
        [ "@type" A..= T.String "textEntity",
          "type" A..= _type_,
          "length" A..= _length_,
          "offset" A..= offset_
        ]

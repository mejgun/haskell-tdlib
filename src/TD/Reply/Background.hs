{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.Background where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.BackgroundType as BackgroundType
import qualified TD.Reply.Document as Document
import qualified Utils as U

data Background = -- | Describes a chat background
  Background
  { -- | Type of the background
    _type :: Maybe BackgroundType.BackgroundType,
    -- | Document with the background; may be null. Null only for filled backgrounds
    document :: Maybe Document.Document,
    -- | Unique background name
    name :: Maybe String,
    -- | True, if the background is dark and is recommended to be used with dark theme
    is_dark :: Maybe Bool,
    -- | True, if this is one of default backgrounds
    is_default :: Maybe Bool,
    -- | Unique background identifier
    _id :: Maybe Int
  }
  deriving (Eq)

instance Show Background where
  show
    Background
      { _type = _type,
        document = document,
        name = name,
        is_dark = is_dark,
        is_default = is_default,
        _id = _id
      } =
      "Background"
        ++ U.cc
          [ U.p "_type" _type,
            U.p "document" document,
            U.p "name" name,
            U.p "is_dark" is_dark,
            U.p "is_default" is_default,
            U.p "_id" _id
          ]

instance T.FromJSON Background where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "background" -> parseBackground v
      _ -> fail ""
    where
      parseBackground :: A.Value -> T.Parser Background
      parseBackground = A.withObject "Background" $ \o -> do
        _type_ <- o A..:? "type"
        document_ <- o A..:? "document"
        name_ <- o A..:? "name"
        is_dark_ <- o A..:? "is_dark"
        is_default_ <- o A..:? "is_default"
        _id_ <- mconcat [o A..:? "id", U.rm <$> (o A..: "id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ Background {_type = _type_, document = document_, name = name_, is_dark = is_dark_, is_default = is_default_, _id = _id_}
  parseJSON _ = fail ""

instance T.ToJSON Background where
  toJSON
    Background
      { _type = _type,
        document = document,
        name = name,
        is_dark = is_dark,
        is_default = is_default,
        _id = _id
      } =
      A.object
        [ "@type" A..= T.String "background",
          "type" A..= _type,
          "document" A..= document,
          "name" A..= name,
          "is_dark" A..= is_dark,
          "is_default" A..= is_default,
          "id" A..= _id
        ]

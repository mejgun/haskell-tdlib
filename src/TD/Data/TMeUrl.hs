{-# LANGUAGE OverloadedStrings #-}

module TD.Data.TMeUrl where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.TMeUrlType as TMeUrlType
import qualified Utils as U

data TMeUrl = -- | Represents a URL linking to an internal Telegram entity @url URL @type Type of the URL
  TMeUrl
  { -- |
    _type :: Maybe TMeUrlType.TMeUrlType,
    -- |
    url :: Maybe String
  }
  deriving (Eq)

instance Show TMeUrl where
  show
    TMeUrl
      { _type = _type,
        url = url
      } =
      "TMeUrl"
        ++ U.cc
          [ U.p "_type" _type,
            U.p "url" url
          ]

instance T.FromJSON TMeUrl where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "tMeUrl" -> parseTMeUrl v
      _ -> mempty
    where
      parseTMeUrl :: A.Value -> T.Parser TMeUrl
      parseTMeUrl = A.withObject "TMeUrl" $ \o -> do
        _type_ <- o A..:? "type"
        url_ <- o A..:? "url"
        return $ TMeUrl {_type = _type_, url = url_}
  parseJSON _ = mempty

instance T.ToJSON TMeUrl where
  toJSON
    TMeUrl
      { _type = _type,
        url = url
      } =
      A.object
        [ "@type" A..= T.String "tMeUrl",
          "type" A..= _type,
          "url" A..= url
        ]

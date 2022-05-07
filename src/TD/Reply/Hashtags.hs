{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.Hashtags where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

data Hashtags = -- | Contains a list of hashtags @hashtags A list of hashtags
  Hashtags
  { -- |
    hashtags :: Maybe [String]
  }
  deriving (Eq)

instance Show Hashtags where
  show
    Hashtags
      { hashtags = hashtags
      } =
      "Hashtags"
        ++ U.cc
          [ U.p "hashtags" hashtags
          ]

instance T.FromJSON Hashtags where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "hashtags" -> parseHashtags v
      _ -> fail ""
    where
      parseHashtags :: A.Value -> T.Parser Hashtags
      parseHashtags = A.withObject "Hashtags" $ \o -> do
        hashtags_ <- o A..:? "hashtags"
        return $ Hashtags {hashtags = hashtags_}
  parseJSON _ = fail ""

instance T.ToJSON Hashtags where
  toJSON
    Hashtags
      { hashtags = hashtags
      } =
      A.object
        [ "@type" A..= T.String "hashtags",
          "hashtags" A..= hashtags
        ]

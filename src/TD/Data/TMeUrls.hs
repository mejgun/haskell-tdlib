{-# LANGUAGE OverloadedStrings #-}

module TD.Data.TMeUrls where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.TMeUrl as TMeUrl
import qualified Utils as U

data TMeUrls = -- | Contains a list of t.me URLs @urls List of URLs
  TMeUrls
  { -- |
    urls :: Maybe [TMeUrl.TMeUrl]
  }
  deriving (Eq)

instance Show TMeUrls where
  show
    TMeUrls
      { urls = urls
      } =
      "TMeUrls"
        ++ U.cc
          [ U.p "urls" urls
          ]

instance T.FromJSON TMeUrls where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "tMeUrls" -> parseTMeUrls v
      _ -> mempty
    where
      parseTMeUrls :: A.Value -> T.Parser TMeUrls
      parseTMeUrls = A.withObject "TMeUrls" $ \o -> do
        urls_ <- o A..:? "urls"
        return $ TMeUrls {urls = urls_}
  parseJSON _ = mempty

instance T.ToJSON TMeUrls where
  toJSON
    TMeUrls
      { urls = urls
      } =
      A.object
        [ "@type" A..= T.String "tMeUrls",
          "urls" A..= urls
        ]

{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.WebAppInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
data WebAppInfo = -- | Contains information about a Web App @launch_id Unique identifier for the Web App launch @url A Web App URL to open in a web view
  WebAppInfo
  { -- |
    url :: Maybe String,
    -- |
    launch_id :: Maybe Int
  }
  deriving (Eq)

instance Show WebAppInfo where
  show
    WebAppInfo
      { url = url_,
        launch_id = launch_id_
      } =
      "WebAppInfo"
        ++ U.cc
          [ U.p "url" url_,
            U.p "launch_id" launch_id_
          ]

instance T.FromJSON WebAppInfo where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "webAppInfo" -> parseWebAppInfo v
      _ -> mempty
    where
      parseWebAppInfo :: A.Value -> T.Parser WebAppInfo
      parseWebAppInfo = A.withObject "WebAppInfo" $ \o -> do
        url_ <- o A..:? "url"
        launch_id_ <- U.rm <$> (o A..:? "launch_id" :: T.Parser (Maybe String)) :: T.Parser (Maybe Int)
        return $ WebAppInfo {url = url_, launch_id = launch_id_}
  parseJSON _ = mempty

instance T.ToJSON WebAppInfo where
  toJSON
    WebAppInfo
      { url = url_,
        launch_id = launch_id_
      } =
      A.object
        [ "@type" A..= T.String "webAppInfo",
          "url" A..= url_,
          "launch_id" A..= U.toS launch_id_
        ]

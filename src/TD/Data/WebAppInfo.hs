module TD.Data.WebAppInfo
  (WebAppInfo(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data WebAppInfo
  = WebAppInfo -- ^ Contains information about a Web App
    { launch_id :: Maybe Int    -- ^ Unique identifier for the Web App launch
    , url       :: Maybe T.Text -- ^ A Web App URL to open in a web view
    }
  deriving (Eq, Show)

instance I.ShortShow WebAppInfo where
  shortShow WebAppInfo
    { launch_id = launch_id_
    , url       = url_
    }
      = "WebAppInfo"
        ++ I.cc
        [ "launch_id" `I.p` launch_id_
        , "url"       `I.p` url_
        ]

instance AT.FromJSON WebAppInfo where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "webAppInfo" -> parseWebAppInfo v
      _            -> mempty
    
    where
      parseWebAppInfo :: A.Value -> AT.Parser WebAppInfo
      parseWebAppInfo = A.withObject "WebAppInfo" $ \o -> do
        launch_id_ <- fmap I.readInt64 <$> o A..:?  "launch_id"
        url_       <- o A..:?                       "url"
        pure $ WebAppInfo
          { launch_id = launch_id_
          , url       = url_
          }
  parseJSON _ = mempty


module TD.Data.MainWebApp
  (MainWebApp(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data MainWebApp
  = MainWebApp -- ^ Contains information about the main Web App of a bot
    { url        :: Maybe T.Text -- ^ URL of the Web App to open
    , is_compact :: Maybe Bool   -- ^ True, if the Web App must always be opened in the compact mode instead of the full-size mode
    }
  deriving (Eq, Show)

instance I.ShortShow MainWebApp where
  shortShow MainWebApp
    { url        = url_
    , is_compact = is_compact_
    }
      = "MainWebApp"
        ++ I.cc
        [ "url"        `I.p` url_
        , "is_compact" `I.p` is_compact_
        ]

instance AT.FromJSON MainWebApp where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "mainWebApp" -> parseMainWebApp v
      _            -> mempty
    
    where
      parseMainWebApp :: A.Value -> AT.Parser MainWebApp
      parseMainWebApp = A.withObject "MainWebApp" $ \o -> do
        url_        <- o A..:?  "url"
        is_compact_ <- o A..:?  "is_compact"
        pure $ MainWebApp
          { url        = url_
          , is_compact = is_compact_
          }
  parseJSON _ = mempty


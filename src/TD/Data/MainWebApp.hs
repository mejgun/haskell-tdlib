module TD.Data.MainWebApp
  (MainWebApp(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.WebAppOpenMode as WebAppOpenMode

data MainWebApp
  = MainWebApp -- ^ Contains information about the main Web App of a bot
    { url  :: Maybe T.Text                        -- ^ URL of the Web App to open
    , mode :: Maybe WebAppOpenMode.WebAppOpenMode -- ^ The mode in which the Web App must be opened
    }
  deriving (Eq, Show)

instance I.ShortShow MainWebApp where
  shortShow MainWebApp
    { url  = url_
    , mode = mode_
    }
      = "MainWebApp"
        ++ I.cc
        [ "url"  `I.p` url_
        , "mode" `I.p` mode_
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
        url_  <- o A..:?  "url"
        mode_ <- o A..:?  "mode"
        pure $ MainWebApp
          { url  = url_
          , mode = mode_
          }
  parseJSON _ = mempty


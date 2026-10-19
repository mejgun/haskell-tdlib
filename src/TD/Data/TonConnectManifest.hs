module TD.Data.TonConnectManifest
  (TonConnectManifest(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.Document as Document

-- | Describes manifest of the dApp that is being connected using TON Connect
data TonConnectManifest
  = TonConnectManifestPending -- ^ The manifest is being downloaded
  | TonConnectManifestInfo -- ^ The manifest is available
    { url  :: Maybe T.Text            -- ^ URL of the dApp
    , name :: Maybe T.Text            -- ^ Name of the dApp
    , icon :: Maybe Document.Document -- ^ App icon in PNG or ICO format
    }
  | TonConnectManifestFailed -- ^ The manifest has failed to download
  | TonConnectManifestInvalid -- ^ The manifest is invalid
  deriving (Eq, Show)

instance I.ShortShow TonConnectManifest where
  shortShow TonConnectManifestPending
      = "TonConnectManifestPending"
  shortShow TonConnectManifestInfo
    { url  = url_
    , name = name_
    , icon = icon_
    }
      = "TonConnectManifestInfo"
        ++ I.cc
        [ "url"  `I.p` url_
        , "name" `I.p` name_
        , "icon" `I.p` icon_
        ]
  shortShow TonConnectManifestFailed
      = "TonConnectManifestFailed"
  shortShow TonConnectManifestInvalid
      = "TonConnectManifestInvalid"

instance AT.FromJSON TonConnectManifest where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "tonConnectManifestPending" -> pure TonConnectManifestPending
      "tonConnectManifestInfo"    -> parseTonConnectManifestInfo v
      "tonConnectManifestFailed"  -> pure TonConnectManifestFailed
      "tonConnectManifestInvalid" -> pure TonConnectManifestInvalid
      _                           -> mempty
    
    where
      parseTonConnectManifestInfo :: A.Value -> AT.Parser TonConnectManifest
      parseTonConnectManifestInfo = A.withObject "TonConnectManifestInfo" $ \o -> do
        url_  <- o A..:?  "url"
        name_ <- o A..:?  "name"
        icon_ <- o A..:?  "icon"
        pure $ TonConnectManifestInfo
          { url  = url_
          , name = name_
          , icon = icon_
          }
  parseJSON _ = mempty


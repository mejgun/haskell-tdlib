module TD.Data.TonCenterStreamingApiUrl
  (TonCenterStreamingApiUrl(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data TonCenterStreamingApiUrl
  = TonCenterStreamingApiUrl -- ^ Contains an HTTP URL for TON Center Streaming API
    { url        :: Maybe T.Text -- ^ The URL
    , expires_in :: Maybe Int    -- ^ Time after which the URL expires
    }
  deriving (Eq, Show)

instance I.ShortShow TonCenterStreamingApiUrl where
  shortShow TonCenterStreamingApiUrl
    { url        = url_
    , expires_in = expires_in_
    }
      = "TonCenterStreamingApiUrl"
        ++ I.cc
        [ "url"        `I.p` url_
        , "expires_in" `I.p` expires_in_
        ]

instance AT.FromJSON TonCenterStreamingApiUrl where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "tonCenterStreamingApiUrl" -> parseTonCenterStreamingApiUrl v
      _                          -> mempty
    
    where
      parseTonCenterStreamingApiUrl :: A.Value -> AT.Parser TonCenterStreamingApiUrl
      parseTonCenterStreamingApiUrl = A.withObject "TonCenterStreamingApiUrl" $ \o -> do
        url_        <- o A..:?  "url"
        expires_in_ <- o A..:?  "expires_in"
        pure $ TonCenterStreamingApiUrl
          { url        = url_
          , expires_in = expires_in_
          }
  parseJSON _ = mempty


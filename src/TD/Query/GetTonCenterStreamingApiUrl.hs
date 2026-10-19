module TD.Query.GetTonCenterStreamingApiUrl
  (GetTonCenterStreamingApiUrl(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns a URL for TON Center Streaming API. Returns 'TD.Data.TonCenterStreamingApiUrl.TonCenterStreamingApiUrl'
data GetTonCenterStreamingApiUrl
  = GetTonCenterStreamingApiUrl
  deriving (Eq, Show)

instance I.ShortShow GetTonCenterStreamingApiUrl where
  shortShow
    GetTonCenterStreamingApiUrl
        = "GetTonCenterStreamingApiUrl"

instance AT.ToJSON GetTonCenterStreamingApiUrl where
  toJSON
    GetTonCenterStreamingApiUrl
        = A.object
          [ "@type" A..= AT.String "getTonCenterStreamingApiUrl"
          ]


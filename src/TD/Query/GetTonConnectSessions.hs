module TD.Query.GetTonConnectSessions
  (GetTonConnectSessions(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns active TON Connect sessions; can be used only if getOption("can_use_ton_wallet"). Returns 'TD.Data.TonConnectSessions.TonConnectSessions'
data GetTonConnectSessions
  = GetTonConnectSessions
  deriving (Eq, Show)

instance I.ShortShow GetTonConnectSessions where
  shortShow
    GetTonConnectSessions
        = "GetTonConnectSessions"

instance AT.ToJSON GetTonConnectSessions where
  toJSON
    GetTonConnectSessions
        = A.object
          [ "@type" A..= AT.String "getTonConnectSessions"
          ]


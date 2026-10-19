module TD.Query.GetTonConnectSessionNextEventId
  (GetTonConnectSessionNextEventId(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns the next event identifier for the given TON Connect session. Returns 'TD.Data.TonConnectSessionEventId.TonConnectSessionEventId'
data GetTonConnectSessionNextEventId
  = GetTonConnectSessionNextEventId
    { session_id :: Maybe Int -- ^ Unique identifier of the TON Connect session
    }
  deriving (Eq, Show)

instance I.ShortShow GetTonConnectSessionNextEventId where
  shortShow
    GetTonConnectSessionNextEventId
      { session_id = session_id_
      }
        = "GetTonConnectSessionNextEventId"
          ++ I.cc
          [ "session_id" `I.p` session_id_
          ]

instance AT.ToJSON GetTonConnectSessionNextEventId where
  toJSON
    GetTonConnectSessionNextEventId
      { session_id = session_id_
      }
        = A.object
          [ "@type"      A..= AT.String "getTonConnectSessionNextEventId"
          , "session_id" A..= fmap I.writeInt64  session_id_
          ]


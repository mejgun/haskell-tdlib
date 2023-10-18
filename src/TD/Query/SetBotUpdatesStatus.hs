module TD.Query.SetBotUpdatesStatus
  (SetBotUpdatesStatus(..)
  , defaultSetBotUpdatesStatus
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Informs the server about the number of pending bot updates if they haven't been processed for a long time; for bots only. Returns 'TD.Data.Ok.Ok'
data SetBotUpdatesStatus
  = SetBotUpdatesStatus
    { pending_update_count :: Maybe Int    -- ^ The number of pending updates
    , error_message        :: Maybe T.Text -- ^ The last error message
    }
  deriving (Eq, Show)

instance I.ShortShow SetBotUpdatesStatus where
  shortShow
    SetBotUpdatesStatus
      { pending_update_count = pending_update_count_
      , error_message        = error_message_
      }
        = "SetBotUpdatesStatus"
          ++ I.cc
          [ "pending_update_count" `I.p` pending_update_count_
          , "error_message"        `I.p` error_message_
          ]

instance AT.ToJSON SetBotUpdatesStatus where
  toJSON
    SetBotUpdatesStatus
      { pending_update_count = pending_update_count_
      , error_message        = error_message_
      }
        = A.object
          [ "@type"                A..= AT.String "setBotUpdatesStatus"
          , "pending_update_count" A..= pending_update_count_
          , "error_message"        A..= error_message_
          ]

defaultSetBotUpdatesStatus :: SetBotUpdatesStatus
defaultSetBotUpdatesStatus =
  SetBotUpdatesStatus
    { pending_update_count = Nothing
    , error_message        = Nothing
    }


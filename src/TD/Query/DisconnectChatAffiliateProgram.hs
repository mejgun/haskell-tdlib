module TD.Query.DisconnectChatAffiliateProgram
  (DisconnectChatAffiliateProgram(..)
  , defaultDisconnectChatAffiliateProgram
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Disconnects an affiliate program from the given chat and immediately deactivates its referral link. Returns updated information about the disconnected affiliate program. Returns 'TD.Data.ChatAffiliateProgram.ChatAffiliateProgram'
data DisconnectChatAffiliateProgram
  = DisconnectChatAffiliateProgram
    { chat_id :: Maybe Int    -- ^ Identifier of the chat for which the affiliate program is connected
    , url     :: Maybe T.Text -- ^ The referral link of the affiliate program
    }
  deriving (Eq, Show)

instance I.ShortShow DisconnectChatAffiliateProgram where
  shortShow
    DisconnectChatAffiliateProgram
      { chat_id = chat_id_
      , url     = url_
      }
        = "DisconnectChatAffiliateProgram"
          ++ I.cc
          [ "chat_id" `I.p` chat_id_
          , "url"     `I.p` url_
          ]

instance AT.ToJSON DisconnectChatAffiliateProgram where
  toJSON
    DisconnectChatAffiliateProgram
      { chat_id = chat_id_
      , url     = url_
      }
        = A.object
          [ "@type"   A..= AT.String "disconnectChatAffiliateProgram"
          , "chat_id" A..= chat_id_
          , "url"     A..= url_
          ]

defaultDisconnectChatAffiliateProgram :: DisconnectChatAffiliateProgram
defaultDisconnectChatAffiliateProgram =
  DisconnectChatAffiliateProgram
    { chat_id = Nothing
    , url     = Nothing
    }


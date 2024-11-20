module TD.Query.SavePreparedInlineMessage
  (SavePreparedInlineMessage(..)
  , defaultSavePreparedInlineMessage
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputInlineQueryResult as InputInlineQueryResult
import qualified TD.Data.TargetChatTypes as TargetChatTypes

-- | Saves an inline message to be sent by the given user; for bots only. Returns 'TD.Data.PreparedInlineMessageId.PreparedInlineMessageId'
data SavePreparedInlineMessage
  = SavePreparedInlineMessage
    { user_id    :: Maybe Int                                           -- ^ Identifier of the user
    , result     :: Maybe InputInlineQueryResult.InputInlineQueryResult -- ^ The description of the message
    , chat_types :: Maybe TargetChatTypes.TargetChatTypes               -- ^ Types of the chats to which the message can be sent
    }
  deriving (Eq, Show)

instance I.ShortShow SavePreparedInlineMessage where
  shortShow
    SavePreparedInlineMessage
      { user_id    = user_id_
      , result     = result_
      , chat_types = chat_types_
      }
        = "SavePreparedInlineMessage"
          ++ I.cc
          [ "user_id"    `I.p` user_id_
          , "result"     `I.p` result_
          , "chat_types" `I.p` chat_types_
          ]

instance AT.ToJSON SavePreparedInlineMessage where
  toJSON
    SavePreparedInlineMessage
      { user_id    = user_id_
      , result     = result_
      , chat_types = chat_types_
      }
        = A.object
          [ "@type"      A..= AT.String "savePreparedInlineMessage"
          , "user_id"    A..= user_id_
          , "result"     A..= result_
          , "chat_types" A..= chat_types_
          ]

defaultSavePreparedInlineMessage :: SavePreparedInlineMessage
defaultSavePreparedInlineMessage =
  SavePreparedInlineMessage
    { user_id    = Nothing
    , result     = Nothing
    , chat_types = Nothing
    }


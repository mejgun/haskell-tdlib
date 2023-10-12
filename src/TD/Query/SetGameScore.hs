module TD.Query.SetGameScore where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data SetGameScore -- ^ Updates the game score of the specified user in the game; for bots only
  = SetGameScore
    { chat_id      :: Maybe Int  -- ^ The chat to which the message with the game belongs
    , message_id   :: Maybe Int  -- ^ Identifier of the message
    , edit_message :: Maybe Bool -- ^ Pass true to edit the game message to include the current scoreboard
    , user_id      :: Maybe Int  -- ^ User identifier
    , score        :: Maybe Int  -- ^ The new score
    , force        :: Maybe Bool -- ^ Pass true to update the score even if it decreases. If the score is 0, the user will be deleted from the high score table
    }
  deriving (Eq)

instance Show SetGameScore where
  show
    SetGameScore
      { chat_id      = chat_id_
      , message_id   = message_id_
      , edit_message = edit_message_
      , user_id      = user_id_
      , score        = score_
      , force        = force_
      }
        = "SetGameScore"
          ++ I.cc
          [ "chat_id"      `I.p` chat_id_
          , "message_id"   `I.p` message_id_
          , "edit_message" `I.p` edit_message_
          , "user_id"      `I.p` user_id_
          , "score"        `I.p` score_
          , "force"        `I.p` force_
          ]

instance AT.ToJSON SetGameScore where
  toJSON
    SetGameScore
      { chat_id      = chat_id_
      , message_id   = message_id_
      , edit_message = edit_message_
      , user_id      = user_id_
      , score        = score_
      , force        = force_
      }
        = A.object
          [ "@type"        A..= AT.String "setGameScore"
          , "chat_id"      A..= chat_id_
          , "message_id"   A..= message_id_
          , "edit_message" A..= edit_message_
          , "user_id"      A..= user_id_
          , "score"        A..= score_
          , "force"        A..= force_
          ]

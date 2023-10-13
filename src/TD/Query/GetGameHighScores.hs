module TD.Query.GetGameHighScores(GetGameHighScores(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data GetGameHighScores -- ^ Returns the high scores for a game and some part of the high score table in the range of the specified user; for bots only
  = GetGameHighScores
    { chat_id    :: Maybe Int -- ^ The chat that contains the message with the game
    , message_id :: Maybe Int -- ^ Identifier of the message
    , user_id    :: Maybe Int -- ^ User identifier
    }
  deriving (Eq)

instance Show GetGameHighScores where
  show
    GetGameHighScores
      { chat_id    = chat_id_
      , message_id = message_id_
      , user_id    = user_id_
      }
        = "GetGameHighScores"
          ++ I.cc
          [ "chat_id"    `I.p` chat_id_
          , "message_id" `I.p` message_id_
          , "user_id"    `I.p` user_id_
          ]

instance AT.ToJSON GetGameHighScores where
  toJSON
    GetGameHighScores
      { chat_id    = chat_id_
      , message_id = message_id_
      , user_id    = user_id_
      }
        = A.object
          [ "@type"      A..= AT.String "getGameHighScores"
          , "chat_id"    A..= chat_id_
          , "message_id" A..= message_id_
          , "user_id"    A..= user_id_
          ]

module TD.Query.SetInlineGameScore
  (SetInlineGameScore(..)
  , defaultSetInlineGameScore
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Updates the game score of the specified user in a game; for bots only. Returns 'TD.Data.Ok.Ok'
data SetInlineGameScore
  = SetInlineGameScore
    { inline_message_id :: Maybe T.Text -- ^ Inline message identifier
    , edit_message      :: Maybe Bool   -- ^ Pass true to edit the game message to include the current scoreboard
    , user_id           :: Maybe Int    -- ^ User identifier
    , score             :: Maybe Int    -- ^ The new score
    , force             :: Maybe Bool   -- ^ Pass true to update the score even if it decreases. If the score is 0, the user will be deleted from the high score table
    }
  deriving (Eq, Show)

instance I.ShortShow SetInlineGameScore where
  shortShow
    SetInlineGameScore
      { inline_message_id = inline_message_id_
      , edit_message      = edit_message_
      , user_id           = user_id_
      , score             = score_
      , force             = force_
      }
        = "SetInlineGameScore"
          ++ I.cc
          [ "inline_message_id" `I.p` inline_message_id_
          , "edit_message"      `I.p` edit_message_
          , "user_id"           `I.p` user_id_
          , "score"             `I.p` score_
          , "force"             `I.p` force_
          ]

instance AT.ToJSON SetInlineGameScore where
  toJSON
    SetInlineGameScore
      { inline_message_id = inline_message_id_
      , edit_message      = edit_message_
      , user_id           = user_id_
      , score             = score_
      , force             = force_
      }
        = A.object
          [ "@type"             A..= AT.String "setInlineGameScore"
          , "inline_message_id" A..= inline_message_id_
          , "edit_message"      A..= edit_message_
          , "user_id"           A..= user_id_
          , "score"             A..= score_
          , "force"             A..= force_
          ]

defaultSetInlineGameScore :: SetInlineGameScore
defaultSetInlineGameScore =
  SetInlineGameScore
    { inline_message_id = Nothing
    , edit_message      = Nothing
    , user_id           = Nothing
    , score             = Nothing
    , force             = Nothing
    }


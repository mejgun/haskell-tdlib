{-# LANGUAGE OverloadedStrings #-}

module TD.Query.SetInlineGameScore where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Updates the game score of the specified user in a game; for bots only @inline_message_id Inline message identifier @edit_message Pass true to edit the game message to include the current scoreboard @user_id User identifier @score The new score
data SetInlineGameScore = SetInlineGameScore
  { -- | Pass true to update the score even if it decreases. If the score is 0, the user will be deleted from the high score table
    force :: Maybe Bool,
    -- |
    score :: Maybe Int,
    -- |
    user_id :: Maybe Int,
    -- |
    edit_message :: Maybe Bool,
    -- |
    inline_message_id :: Maybe String
  }
  deriving (Eq)

instance Show SetInlineGameScore where
  show
    SetInlineGameScore
      { force = force,
        score = score,
        user_id = user_id,
        edit_message = edit_message,
        inline_message_id = inline_message_id
      } =
      "SetInlineGameScore"
        ++ U.cc
          [ U.p "force" force,
            U.p "score" score,
            U.p "user_id" user_id,
            U.p "edit_message" edit_message,
            U.p "inline_message_id" inline_message_id
          ]

instance T.ToJSON SetInlineGameScore where
  toJSON
    SetInlineGameScore
      { force = force,
        score = score,
        user_id = user_id,
        edit_message = edit_message,
        inline_message_id = inline_message_id
      } =
      A.object
        [ "@type" A..= T.String "setInlineGameScore",
          "force" A..= force,
          "score" A..= score,
          "user_id" A..= user_id,
          "edit_message" A..= edit_message,
          "inline_message_id" A..= inline_message_id
        ]

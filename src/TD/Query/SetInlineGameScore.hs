{-# LANGUAGE OverloadedStrings #-}

-- |
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
      { force = force_,
        score = score_,
        user_id = user_id_,
        edit_message = edit_message_,
        inline_message_id = inline_message_id_
      } =
      "SetInlineGameScore"
        ++ U.cc
          [ U.p "force" force_,
            U.p "score" score_,
            U.p "user_id" user_id_,
            U.p "edit_message" edit_message_,
            U.p "inline_message_id" inline_message_id_
          ]

instance T.ToJSON SetInlineGameScore where
  toJSON
    SetInlineGameScore
      { force = force_,
        score = score_,
        user_id = user_id_,
        edit_message = edit_message_,
        inline_message_id = inline_message_id_
      } =
      A.object
        [ "@type" A..= T.String "setInlineGameScore",
          "force" A..= force_,
          "score" A..= score_,
          "user_id" A..= user_id_,
          "edit_message" A..= edit_message_,
          "inline_message_id" A..= inline_message_id_
        ]

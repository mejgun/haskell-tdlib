{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetInlineGameHighScores where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns game high scores and some part of the high score table in the range of the specified user; for bots only @inline_message_id Inline message identifier @user_id User identifier
data GetInlineGameHighScores = GetInlineGameHighScores
  { -- |
    user_id :: Maybe Int,
    -- |
    inline_message_id :: Maybe String
  }
  deriving (Eq)

instance Show GetInlineGameHighScores where
  show
    GetInlineGameHighScores
      { user_id = user_id_,
        inline_message_id = inline_message_id_
      } =
      "GetInlineGameHighScores"
        ++ U.cc
          [ U.p "user_id" user_id_,
            U.p "inline_message_id" inline_message_id_
          ]

instance T.ToJSON GetInlineGameHighScores where
  toJSON
    GetInlineGameHighScores
      { user_id = user_id_,
        inline_message_id = inline_message_id_
      } =
      A.object
        [ "@type" A..= T.String "getInlineGameHighScores",
          "user_id" A..= user_id_,
          "inline_message_id" A..= inline_message_id_
        ]

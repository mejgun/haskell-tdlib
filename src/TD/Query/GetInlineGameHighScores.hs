module TD.Query.GetInlineGameHighScores
  (GetInlineGameHighScores(..)
  , defaultGetInlineGameHighScores
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Returns game high scores and some part of the high score table in the range of the specified user; for bots only. Returns 'TD.Data.GameHighScores.GameHighScores'
data GetInlineGameHighScores
  = GetInlineGameHighScores
    { inline_message_id :: Maybe T.Text -- ^ Inline message identifier
    , user_id           :: Maybe Int    -- ^ User identifier
    }
  deriving (Eq, Show)

instance I.ShortShow GetInlineGameHighScores where
  shortShow
    GetInlineGameHighScores
      { inline_message_id = inline_message_id_
      , user_id           = user_id_
      }
        = "GetInlineGameHighScores"
          ++ I.cc
          [ "inline_message_id" `I.p` inline_message_id_
          , "user_id"           `I.p` user_id_
          ]

instance AT.ToJSON GetInlineGameHighScores where
  toJSON
    GetInlineGameHighScores
      { inline_message_id = inline_message_id_
      , user_id           = user_id_
      }
        = A.object
          [ "@type"             A..= AT.String "getInlineGameHighScores"
          , "inline_message_id" A..= inline_message_id_
          , "user_id"           A..= user_id_
          ]

defaultGetInlineGameHighScores :: GetInlineGameHighScores
defaultGetInlineGameHighScores =
  GetInlineGameHighScores
    { inline_message_id = Nothing
    , user_id           = Nothing
    }


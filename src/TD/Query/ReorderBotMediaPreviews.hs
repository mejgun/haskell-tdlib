module TD.Query.ReorderBotMediaPreviews
  (ReorderBotMediaPreviews(..)
  , defaultReorderBotMediaPreviews
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Changes order of media previews in the list of media previews of a bot. Returns 'TD.Data.Ok.Ok'
data ReorderBotMediaPreviews
  = ReorderBotMediaPreviews
    { bot_user_id   :: Maybe Int    -- ^ Identifier of the target bot. The bot must be owned and must have the main Web App
    , language_code :: Maybe T.Text -- ^ Language code of the media previews to reorder
    , file_ids      :: Maybe [Int]  -- ^ File identifiers of the media in the new order
    }
  deriving (Eq, Show)

instance I.ShortShow ReorderBotMediaPreviews where
  shortShow
    ReorderBotMediaPreviews
      { bot_user_id   = bot_user_id_
      , language_code = language_code_
      , file_ids      = file_ids_
      }
        = "ReorderBotMediaPreviews"
          ++ I.cc
          [ "bot_user_id"   `I.p` bot_user_id_
          , "language_code" `I.p` language_code_
          , "file_ids"      `I.p` file_ids_
          ]

instance AT.ToJSON ReorderBotMediaPreviews where
  toJSON
    ReorderBotMediaPreviews
      { bot_user_id   = bot_user_id_
      , language_code = language_code_
      , file_ids      = file_ids_
      }
        = A.object
          [ "@type"         A..= AT.String "reorderBotMediaPreviews"
          , "bot_user_id"   A..= bot_user_id_
          , "language_code" A..= language_code_
          , "file_ids"      A..= file_ids_
          ]

defaultReorderBotMediaPreviews :: ReorderBotMediaPreviews
defaultReorderBotMediaPreviews =
  ReorderBotMediaPreviews
    { bot_user_id   = Nothing
    , language_code = Nothing
    , file_ids      = Nothing
    }


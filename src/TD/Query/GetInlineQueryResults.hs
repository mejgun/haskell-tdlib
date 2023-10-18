module TD.Query.GetInlineQueryResults
  (GetInlineQueryResults(..)
  , defaultGetInlineQueryResults
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.Location as Location
import qualified Data.Text as T

-- | Sends an inline query to a bot and returns its results. Returns an error with code 502 if the bot fails to answer the query before the query timeout expires. Returns 'TD.Data.InlineQueryResults.InlineQueryResults'
data GetInlineQueryResults
  = GetInlineQueryResults
    { bot_user_id   :: Maybe Int               -- ^ Identifier of the target bot
    , chat_id       :: Maybe Int               -- ^ Identifier of the chat where the query was sent
    , user_location :: Maybe Location.Location -- ^ Location of the user; pass null if unknown or the bot doesn't need user's location
    , query         :: Maybe T.Text            -- ^ Text of the query
    , offset        :: Maybe T.Text            -- ^ Offset of the first entry to return; use empty string to get the first chunk of results
    }
  deriving (Eq, Show)

instance I.ShortShow GetInlineQueryResults where
  shortShow
    GetInlineQueryResults
      { bot_user_id   = bot_user_id_
      , chat_id       = chat_id_
      , user_location = user_location_
      , query         = query_
      , offset        = offset_
      }
        = "GetInlineQueryResults"
          ++ I.cc
          [ "bot_user_id"   `I.p` bot_user_id_
          , "chat_id"       `I.p` chat_id_
          , "user_location" `I.p` user_location_
          , "query"         `I.p` query_
          , "offset"        `I.p` offset_
          ]

instance AT.ToJSON GetInlineQueryResults where
  toJSON
    GetInlineQueryResults
      { bot_user_id   = bot_user_id_
      , chat_id       = chat_id_
      , user_location = user_location_
      , query         = query_
      , offset        = offset_
      }
        = A.object
          [ "@type"         A..= AT.String "getInlineQueryResults"
          , "bot_user_id"   A..= bot_user_id_
          , "chat_id"       A..= chat_id_
          , "user_location" A..= user_location_
          , "query"         A..= query_
          , "offset"        A..= offset_
          ]

defaultGetInlineQueryResults :: GetInlineQueryResults
defaultGetInlineQueryResults =
  GetInlineQueryResults
    { bot_user_id   = Nothing
    , chat_id       = Nothing
    , user_location = Nothing
    , query         = Nothing
    , offset        = Nothing
    }


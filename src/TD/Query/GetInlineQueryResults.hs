{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetInlineQueryResults where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.Location as Location
import qualified Utils as U

-- |
-- Sends an inline query to a bot and returns its results. Returns an error with code 502 if the bot fails to answer the query before the query timeout expires
data GetInlineQueryResults = GetInlineQueryResults
  { -- | Offset of the first entry to return; use empty string to get the first chunk of results
    offset :: Maybe String,
    -- | Text of the query
    query :: Maybe String,
    -- | Location of the user; pass null if unknown or the bot doesn't need user's location
    user_location :: Maybe Location.Location,
    -- | Identifier of the chat where the query was sent
    chat_id :: Maybe Int,
    -- | Identifier of the target bot
    bot_user_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetInlineQueryResults where
  show
    GetInlineQueryResults
      { offset = offset_,
        query = query_,
        user_location = user_location_,
        chat_id = chat_id_,
        bot_user_id = bot_user_id_
      } =
      "GetInlineQueryResults"
        ++ U.cc
          [ U.p "offset" offset_,
            U.p "query" query_,
            U.p "user_location" user_location_,
            U.p "chat_id" chat_id_,
            U.p "bot_user_id" bot_user_id_
          ]

instance T.ToJSON GetInlineQueryResults where
  toJSON
    GetInlineQueryResults
      { offset = offset_,
        query = query_,
        user_location = user_location_,
        chat_id = chat_id_,
        bot_user_id = bot_user_id_
      } =
      A.object
        [ "@type" A..= T.String "getInlineQueryResults",
          "offset" A..= offset_,
          "query" A..= query_,
          "user_location" A..= user_location_,
          "chat_id" A..= chat_id_,
          "bot_user_id" A..= bot_user_id_
        ]

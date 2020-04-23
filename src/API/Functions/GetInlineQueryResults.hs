-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetInlineQueryResults where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.Location as Location

data GetInlineQueryResults = 
 GetInlineQueryResults { offset :: Maybe String, query :: Maybe String, user_location :: Maybe Location.Location, chat_id :: Maybe Int, bot_user_id :: Maybe Int }  deriving (Show)

instance T.ToJSON GetInlineQueryResults where
 toJSON (GetInlineQueryResults { offset = offset, query = query, user_location = user_location, chat_id = chat_id, bot_user_id = bot_user_id }) =
  A.object [ "@type" A..= T.String "getInlineQueryResults", "offset" A..= offset, "query" A..= query, "user_location" A..= user_location, "chat_id" A..= chat_id, "bot_user_id" A..= bot_user_id ]

instance T.FromJSON GetInlineQueryResults where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getInlineQueryResults" -> parseGetInlineQueryResults v
   _ -> mempty
  where
   parseGetInlineQueryResults :: A.Value -> T.Parser GetInlineQueryResults
   parseGetInlineQueryResults = A.withObject "GetInlineQueryResults" $ \o -> do
    offset <- optional $ o A..: "offset"
    query <- optional $ o A..: "query"
    user_location <- optional $ o A..: "user_location"
    chat_id <- optional $ o A..: "chat_id"
    bot_user_id <- optional $ o A..: "bot_user_id"
    return $ GetInlineQueryResults { offset = offset, query = query, user_location = user_location, chat_id = chat_id, bot_user_id = bot_user_id }
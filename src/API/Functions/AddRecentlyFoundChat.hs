-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.AddRecentlyFoundChat where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data AddRecentlyFoundChat = 
 AddRecentlyFoundChat { chat_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON AddRecentlyFoundChat where
 toJSON (AddRecentlyFoundChat { chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "addRecentlyFoundChat", "chat_id" A..= chat_id ]

instance T.FromJSON AddRecentlyFoundChat where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "addRecentlyFoundChat" -> parseAddRecentlyFoundChat v
   _ -> mempty
  where
   parseAddRecentlyFoundChat :: A.Value -> T.Parser AddRecentlyFoundChat
   parseAddRecentlyFoundChat = A.withObject "AddRecentlyFoundChat" $ \o -> do
    chat_id <- optional $ o A..: "chat_id"
    return $ AddRecentlyFoundChat { chat_id = chat_id }
-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.RemoveRecentlyFoundChat where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data RemoveRecentlyFoundChat = 
 RemoveRecentlyFoundChat { chat_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON RemoveRecentlyFoundChat where
 toJSON (RemoveRecentlyFoundChat { chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "removeRecentlyFoundChat", "chat_id" A..= chat_id ]

instance T.FromJSON RemoveRecentlyFoundChat where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "removeRecentlyFoundChat" -> parseRemoveRecentlyFoundChat v
   _ -> mempty
  where
   parseRemoveRecentlyFoundChat :: A.Value -> T.Parser RemoveRecentlyFoundChat
   parseRemoveRecentlyFoundChat = A.withObject "RemoveRecentlyFoundChat" $ \o -> do
    chat_id <- optional $ o A..: "chat_id"
    return $ RemoveRecentlyFoundChat { chat_id = chat_id }
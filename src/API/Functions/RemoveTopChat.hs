-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.RemoveTopChat where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.TopChatCategory as TopChatCategory

data RemoveTopChat = 
 RemoveTopChat { chat_id :: Int, category :: TopChatCategory.TopChatCategory }  deriving (Show)

instance T.ToJSON RemoveTopChat where
 toJSON (RemoveTopChat { chat_id = chat_id, category = category }) =
  A.object [ "@type" A..= T.String "removeTopChat", "chat_id" A..= chat_id, "category" A..= category ]

instance T.FromJSON RemoveTopChat where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "removeTopChat" -> parseRemoveTopChat v
   _ -> mempty
  where
   parseRemoveTopChat :: A.Value -> T.Parser RemoveTopChat
   parseRemoveTopChat = A.withObject "RemoveTopChat" $ \o -> do
    chat_id <- o A..: "chat_id"
    category <- o A..: "category"
    return $ RemoveTopChat { chat_id = chat_id, category = category }
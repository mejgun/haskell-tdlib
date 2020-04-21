-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.RemoveChatActionBar where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data RemoveChatActionBar = 
 RemoveChatActionBar { chat_id :: Int }  deriving (Show)

instance T.ToJSON RemoveChatActionBar where
 toJSON (RemoveChatActionBar { chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "removeChatActionBar", "chat_id" A..= chat_id ]



instance T.FromJSON RemoveChatActionBar where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "removeChatActionBar" -> parseRemoveChatActionBar v

   _ -> mempty ""
  where
   parseRemoveChatActionBar :: A.Value -> T.Parser RemoveChatActionBar
   parseRemoveChatActionBar = A.withObject "RemoveChatActionBar" $ \o -> do
    chat_id <- o A..: "chat_id"
    return $ RemoveChatActionBar { chat_id = chat_id }
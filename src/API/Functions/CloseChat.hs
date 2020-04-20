-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CloseChat where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data CloseChat = 
 CloseChat { chat_id :: Int }  -- deriving (Show)

instance T.ToJSON CloseChat where
 toJSON (CloseChat { chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "closeChat", "chat_id" A..= chat_id ]
-- closeChat CloseChat  { chat_id :: Int } 



instance T.FromJSON CloseChat where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "closeChat" -> parseCloseChat v
  where
   parseCloseChat :: A.Value -> T.Parser CloseChat
   parseCloseChat = A.withObject "CloseChat" $ \o -> do
    chat_id <- o A..: "chat_id"
    return $ CloseChat { chat_id = chat_id }
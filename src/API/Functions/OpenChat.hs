-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.OpenChat where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data OpenChat = 
 OpenChat { chat_id :: Int }  -- deriving (Show)

instance T.ToJSON OpenChat where
 toJSON (OpenChat { chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "openChat", "chat_id" A..= chat_id ]
-- openChat OpenChat  { chat_id :: Int } 



instance T.FromJSON OpenChat where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "openChat" -> parseOpenChat v
  where
   parseOpenChat :: A.Value -> T.Parser OpenChat
   parseOpenChat = A.withObject "OpenChat" $ \o -> do
    chat_id <- o A..: "chat_id"
    return $ OpenChat { chat_id = chat_id }
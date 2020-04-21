-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetChat where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetChat = 
 GetChat { chat_id :: Int }  deriving (Show)

instance T.ToJSON GetChat where
 toJSON (GetChat { chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "getChat", "chat_id" A..= chat_id ]



instance T.FromJSON GetChat where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getChat" -> parseGetChat v

   _ -> mempty ""
  where
   parseGetChat :: A.Value -> T.Parser GetChat
   parseGetChat = A.withObject "GetChat" $ \o -> do
    chat_id <- o A..: "chat_id"
    return $ GetChat { chat_id = chat_id }
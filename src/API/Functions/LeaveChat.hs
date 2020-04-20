-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.LeaveChat where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data LeaveChat = 
 LeaveChat { chat_id :: Int }  -- deriving (Show)

instance T.ToJSON LeaveChat where
 toJSON (LeaveChat { chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "leaveChat", "chat_id" A..= chat_id ]
-- leaveChat LeaveChat  { chat_id :: Int } 



instance T.FromJSON LeaveChat where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "leaveChat" -> parseLeaveChat v
  where
   parseLeaveChat :: A.Value -> T.Parser LeaveChat
   parseLeaveChat = A.withObject "LeaveChat" $ \o -> do
    chat_id <- o A..: "chat_id"
    return $ LeaveChat { chat_id = chat_id }
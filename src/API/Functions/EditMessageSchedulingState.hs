-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.EditMessageSchedulingState where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.MessageSchedulingState as MessageSchedulingState

--main = putStrLn "ok"

data EditMessageSchedulingState = 
 EditMessageSchedulingState { scheduling_state :: MessageSchedulingState.MessageSchedulingState, message_id :: Int, chat_id :: Int }  -- deriving (Show)

instance T.ToJSON EditMessageSchedulingState where
 toJSON (EditMessageSchedulingState { scheduling_state = scheduling_state, message_id = message_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "editMessageSchedulingState", "scheduling_state" A..= scheduling_state, "message_id" A..= message_id, "chat_id" A..= chat_id ]
-- editMessageSchedulingState EditMessageSchedulingState  { scheduling_state :: MessageSchedulingState.MessageSchedulingState, message_id :: Int, chat_id :: Int } 



instance T.FromJSON EditMessageSchedulingState where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "editMessageSchedulingState" -> parseEditMessageSchedulingState v
  where
   parseEditMessageSchedulingState :: A.Value -> T.Parser EditMessageSchedulingState
   parseEditMessageSchedulingState = A.withObject "EditMessageSchedulingState" $ \o -> do
    scheduling_state <- o A..: "scheduling_state"
    message_id <- o A..: "message_id"
    chat_id <- o A..: "chat_id"
    return $ EditMessageSchedulingState { scheduling_state = scheduling_state, message_id = message_id, chat_id = chat_id }
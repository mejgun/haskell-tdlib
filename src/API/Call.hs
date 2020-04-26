-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Call where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.CallState as CallState

-- |
-- 
-- Describes a call 
-- 
-- __id__ Call identifier, not persistent
-- 
-- __user_id__ Peer user identifier
-- 
-- __is_outgoing__ True, if the call is outgoing
-- 
-- __state__ Call state
data Call = 
 Call { state :: Maybe CallState.CallState, is_outgoing :: Maybe Bool, user_id :: Maybe Int, _id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON Call where
 toJSON (Call { state = state, is_outgoing = is_outgoing, user_id = user_id, _id = _id }) =
  A.object [ "@type" A..= T.String "call", "state" A..= state, "is_outgoing" A..= is_outgoing, "user_id" A..= user_id, "id" A..= _id ]

instance T.FromJSON Call where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "call" -> parseCall v
   _ -> mempty
  where
   parseCall :: A.Value -> T.Parser Call
   parseCall = A.withObject "Call" $ \o -> do
    state <- o A..:? "state"
    is_outgoing <- o A..:? "is_outgoing"
    user_id <- mconcat [ o A..:? "user_id", readMaybe <$> (o A..: "user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    _id <- mconcat [ o A..:? "id", readMaybe <$> (o A..: "id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ Call { state = state, is_outgoing = is_outgoing, user_id = user_id, _id = _id }
-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Call where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.CallState as CallState

data Call = 
 Call { state :: Maybe CallState.CallState, is_outgoing :: Maybe Bool, user_id :: Maybe Int, _id :: Maybe Int }  deriving (Show)

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
    state <- optional $ o A..: "state"
    is_outgoing <- optional $ o A..: "is_outgoing"
    user_id <- optional $ o A..: "user_id"
    _id <- optional $ o A..: "id"
    return $ Call { state = state, is_outgoing = is_outgoing, user_id = user_id, _id = _id }
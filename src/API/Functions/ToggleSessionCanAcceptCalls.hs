-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ToggleSessionCanAcceptCalls where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Toggles whether a session can accept incoming calls 
-- 
-- __session_id__ Session identifier
-- 
-- __can_accept_calls__ Pass true to allow accepting incoming calls by the session; pass false otherwise
data ToggleSessionCanAcceptCalls = 

 ToggleSessionCanAcceptCalls { can_accept_calls :: Maybe Bool, session_id :: Maybe Int }  deriving (Eq)

instance Show ToggleSessionCanAcceptCalls where
 show ToggleSessionCanAcceptCalls { can_accept_calls=can_accept_calls, session_id=session_id } =
  "ToggleSessionCanAcceptCalls" ++ U.cc [U.p "can_accept_calls" can_accept_calls, U.p "session_id" session_id ]

instance T.ToJSON ToggleSessionCanAcceptCalls where
 toJSON ToggleSessionCanAcceptCalls { can_accept_calls = can_accept_calls, session_id = session_id } =
  A.object [ "@type" A..= T.String "toggleSessionCanAcceptCalls", "can_accept_calls" A..= can_accept_calls, "session_id" A..= session_id ]

instance T.FromJSON ToggleSessionCanAcceptCalls where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "toggleSessionCanAcceptCalls" -> parseToggleSessionCanAcceptCalls v
   _ -> mempty
  where
   parseToggleSessionCanAcceptCalls :: A.Value -> T.Parser ToggleSessionCanAcceptCalls
   parseToggleSessionCanAcceptCalls = A.withObject "ToggleSessionCanAcceptCalls" $ \o -> do
    can_accept_calls <- o A..:? "can_accept_calls"
    session_id <- mconcat [ o A..:? "session_id", readMaybe <$> (o A..: "session_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ToggleSessionCanAcceptCalls { can_accept_calls = can_accept_calls, session_id = session_id }
 parseJSON _ = mempty

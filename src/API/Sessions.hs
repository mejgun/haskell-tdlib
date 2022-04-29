-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Sessions where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.Session as Session

-- |
-- 
-- Contains a list of sessions 
-- 
-- __sessions__ List of sessions
-- 
-- __inactive_session_ttl_days__ Number of days of inactivity before sessions will automatically be terminated; 1-366 days
data Sessions = 

 Sessions { inactive_session_ttl_days :: Maybe Int, sessions :: Maybe [Session.Session] }  deriving (Eq)

instance Show Sessions where
 show Sessions { inactive_session_ttl_days=inactive_session_ttl_days, sessions=sessions } =
  "Sessions" ++ cc [p "inactive_session_ttl_days" inactive_session_ttl_days, p "sessions" sessions ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON Sessions where
 toJSON Sessions { inactive_session_ttl_days = inactive_session_ttl_days, sessions = sessions } =
  A.object [ "@type" A..= T.String "sessions", "inactive_session_ttl_days" A..= inactive_session_ttl_days, "sessions" A..= sessions ]

instance T.FromJSON Sessions where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "sessions" -> parseSessions v
   _ -> mempty
  where
   parseSessions :: A.Value -> T.Parser Sessions
   parseSessions = A.withObject "Sessions" $ \o -> do
    inactive_session_ttl_days <- mconcat [ o A..:? "inactive_session_ttl_days", readMaybe <$> (o A..: "inactive_session_ttl_days" :: T.Parser String)] :: T.Parser (Maybe Int)
    sessions <- o A..:? "sessions"
    return $ Sessions { inactive_session_ttl_days = inactive_session_ttl_days, sessions = sessions }
 parseJSON _ = mempty

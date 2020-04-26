-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Sessions where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.Session as Session

-- |
-- 
-- Contains a list of sessions 
-- 
-- __sessions__ List of sessions
data Sessions = 
 Sessions { sessions :: Maybe [Session.Session] }  deriving (Show, Eq)

instance T.ToJSON Sessions where
 toJSON (Sessions { sessions = sessions }) =
  A.object [ "@type" A..= T.String "sessions", "sessions" A..= sessions ]

instance T.FromJSON Sessions where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "sessions" -> parseSessions v
   _ -> mempty
  where
   parseSessions :: A.Value -> T.Parser Sessions
   parseSessions = A.withObject "Sessions" $ \o -> do
    sessions <- o A..:? "sessions"
    return $ Sessions { sessions = sessions }
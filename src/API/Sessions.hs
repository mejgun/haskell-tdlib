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
data Sessions = 

 Sessions { sessions :: Maybe [Session.Session] }  deriving (Eq)

instance Show Sessions where
 show Sessions { sessions=sessions } =
  "Sessions" ++ cc [p "sessions" sessions ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON Sessions where
 toJSON Sessions { sessions = sessions } =
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
 parseJSON _ = mempty

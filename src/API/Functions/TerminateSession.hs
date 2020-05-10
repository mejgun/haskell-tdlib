-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.TerminateSession where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Terminates a session of the current user 
-- 
-- __session_id__ Session identifier
data TerminateSession = 

 TerminateSession { session_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON TerminateSession where
 toJSON (TerminateSession { session_id = session_id }) =
  A.object [ "@type" A..= T.String "terminateSession", "session_id" A..= session_id ]

instance T.FromJSON TerminateSession where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "terminateSession" -> parseTerminateSession v
   _ -> mempty
  where
   parseTerminateSession :: A.Value -> T.Parser TerminateSession
   parseTerminateSession = A.withObject "TerminateSession" $ \o -> do
    session_id <- mconcat [ o A..:? "session_id", readMaybe <$> (o A..: "session_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ TerminateSession { session_id = session_id }
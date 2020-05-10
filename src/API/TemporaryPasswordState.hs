-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.TemporaryPasswordState where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Returns information about the availability of a temporary password, which can be used for payments 
-- 
-- __has_password__ True, if a temporary password is available
-- 
-- __valid_for__ Time left before the temporary password expires, in seconds
data TemporaryPasswordState = 

 TemporaryPasswordState { valid_for :: Maybe Int, has_password :: Maybe Bool }  deriving (Show, Eq)

instance T.ToJSON TemporaryPasswordState where
 toJSON (TemporaryPasswordState { valid_for = valid_for, has_password = has_password }) =
  A.object [ "@type" A..= T.String "temporaryPasswordState", "valid_for" A..= valid_for, "has_password" A..= has_password ]

instance T.FromJSON TemporaryPasswordState where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "temporaryPasswordState" -> parseTemporaryPasswordState v
   _ -> mempty
  where
   parseTemporaryPasswordState :: A.Value -> T.Parser TemporaryPasswordState
   parseTemporaryPasswordState = A.withObject "TemporaryPasswordState" $ \o -> do
    valid_for <- mconcat [ o A..:? "valid_for", readMaybe <$> (o A..: "valid_for" :: T.Parser String)] :: T.Parser (Maybe Int)
    has_password <- o A..:? "has_password"
    return $ TemporaryPasswordState { valid_for = valid_for, has_password = has_password }
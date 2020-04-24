-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.TemporaryPasswordState where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

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
    valid_for <- optional $ o A..: "valid_for"
    has_password <- optional $ o A..: "has_password"
    return $ TemporaryPasswordState { valid_for = valid_for, has_password = has_password }
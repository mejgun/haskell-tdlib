-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.Close where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Closes the TDLib instance. All databases will be flushed to disk and properly closed. After the close completes, updateAuthorizationState with authorizationStateClosed will be sent
data Close = 

 Close deriving (Show, Eq)

instance T.ToJSON Close where
 toJSON (Close {  }) =
  A.object [ "@type" A..= T.String "close" ]

instance T.FromJSON Close where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "close" -> parseClose v
   _ -> mempty
  where
   parseClose :: A.Value -> T.Parser Close
   parseClose = A.withObject "Close" $ \o -> do
    return $ Close {  }
-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetInactiveSessionTtl where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Changes the period of inactivity after which sessions will automatically be terminated 
-- 
-- __inactive_session_ttl_days__ New number of days of inactivity before sessions will be automatically terminated; 1-366 days
data SetInactiveSessionTtl = 

 SetInactiveSessionTtl { inactive_session_ttl_days :: Maybe Int }  deriving (Eq)

instance Show SetInactiveSessionTtl where
 show SetInactiveSessionTtl { inactive_session_ttl_days=inactive_session_ttl_days } =
  "SetInactiveSessionTtl" ++ U.cc [U.p "inactive_session_ttl_days" inactive_session_ttl_days ]

instance T.ToJSON SetInactiveSessionTtl where
 toJSON SetInactiveSessionTtl { inactive_session_ttl_days = inactive_session_ttl_days } =
  A.object [ "@type" A..= T.String "setInactiveSessionTtl", "inactive_session_ttl_days" A..= inactive_session_ttl_days ]

instance T.FromJSON SetInactiveSessionTtl where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setInactiveSessionTtl" -> parseSetInactiveSessionTtl v
   _ -> mempty
  where
   parseSetInactiveSessionTtl :: A.Value -> T.Parser SetInactiveSessionTtl
   parseSetInactiveSessionTtl = A.withObject "SetInactiveSessionTtl" $ \o -> do
    inactive_session_ttl_days <- mconcat [ o A..:? "inactive_session_ttl_days", readMaybe <$> (o A..: "inactive_session_ttl_days" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ SetInactiveSessionTtl { inactive_session_ttl_days = inactive_session_ttl_days }
 parseJSON _ = mempty

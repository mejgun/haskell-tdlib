-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.EndGroupCallScreenSharing where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Ends screen sharing in a joined group call 
-- 
-- __group_call_id__ Group call identifier
data EndGroupCallScreenSharing = 

 EndGroupCallScreenSharing { group_call_id :: Maybe Int }  deriving (Eq)

instance Show EndGroupCallScreenSharing where
 show EndGroupCallScreenSharing { group_call_id=group_call_id } =
  "EndGroupCallScreenSharing" ++ U.cc [U.p "group_call_id" group_call_id ]

instance T.ToJSON EndGroupCallScreenSharing where
 toJSON EndGroupCallScreenSharing { group_call_id = group_call_id } =
  A.object [ "@type" A..= T.String "endGroupCallScreenSharing", "group_call_id" A..= group_call_id ]

instance T.FromJSON EndGroupCallScreenSharing where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "endGroupCallScreenSharing" -> parseEndGroupCallScreenSharing v
   _ -> mempty
  where
   parseEndGroupCallScreenSharing :: A.Value -> T.Parser EndGroupCallScreenSharing
   parseEndGroupCallScreenSharing = A.withObject "EndGroupCallScreenSharing" $ \o -> do
    group_call_id <- mconcat [ o A..:? "group_call_id", readMaybe <$> (o A..: "group_call_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ EndGroupCallScreenSharing { group_call_id = group_call_id }
 parseJSON _ = mempty

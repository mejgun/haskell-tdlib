-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.StartGroupCallScreenSharing where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Starts screen sharing in a joined group call. Returns join response payload for tgcalls
-- 
-- __group_call_id__ Group call identifier
-- 
-- __audio_source_id__ Screen sharing audio channel synchronization source identifier; received from tgcalls
-- 
-- __payload__ Group call join payload; received from tgcalls
data StartGroupCallScreenSharing = 

 StartGroupCallScreenSharing { payload :: Maybe String, audio_source_id :: Maybe Int, group_call_id :: Maybe Int }  deriving (Eq)

instance Show StartGroupCallScreenSharing where
 show StartGroupCallScreenSharing { payload=payload, audio_source_id=audio_source_id, group_call_id=group_call_id } =
  "StartGroupCallScreenSharing" ++ cc [p "payload" payload, p "audio_source_id" audio_source_id, p "group_call_id" group_call_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON StartGroupCallScreenSharing where
 toJSON StartGroupCallScreenSharing { payload = payload, audio_source_id = audio_source_id, group_call_id = group_call_id } =
  A.object [ "@type" A..= T.String "startGroupCallScreenSharing", "payload" A..= payload, "audio_source_id" A..= audio_source_id, "group_call_id" A..= group_call_id ]

instance T.FromJSON StartGroupCallScreenSharing where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "startGroupCallScreenSharing" -> parseStartGroupCallScreenSharing v
   _ -> mempty
  where
   parseStartGroupCallScreenSharing :: A.Value -> T.Parser StartGroupCallScreenSharing
   parseStartGroupCallScreenSharing = A.withObject "StartGroupCallScreenSharing" $ \o -> do
    payload <- o A..:? "payload"
    audio_source_id <- mconcat [ o A..:? "audio_source_id", readMaybe <$> (o A..: "audio_source_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    group_call_id <- mconcat [ o A..:? "group_call_id", readMaybe <$> (o A..: "group_call_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ StartGroupCallScreenSharing { payload = payload, audio_source_id = audio_source_id, group_call_id = group_call_id }
 parseJSON _ = mempty
